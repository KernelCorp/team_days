class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = %w(new in_progress close)

  field :cost, type: Float
  field :status, type: String
  field :company, type: String


  embeds_one :client_info
  belongs_to :service
  belongs_to :partner, class_name: 'User::Partner'

  has_many :payments

  delegate :name, to: :service, prefix: true, allow_nil: true
  delegate :name, :email, :phone, to: :client_info, prefix: :client

  # validates_presence_of :service, :client_info
  validates_presence_of :client_info
  validate :ordered_services_is_supported_by_partner
  after_initialize :init_client_info

  before_create :update_cost

  def update_cost
    if service.present?
      self.cost = partner.present? ? partner.available_services.where(service: service).first.price : service.price
    end
  end

  def payment_status
    return :without_payment if payments.empty?
    payment_success? ? :payment_success : :payment_in_progress
  end

  def payment_success?
    payments.paid.sum(:sum) >= cost
  end

  protected
  def ordered_services_is_supported_by_partner
    if partner.present? && !partner.support_service?(service)
      errors.add :service, I18n.t('service_not_supported')
    end
  end

  def init_client_info
    if client_info.nil?
      build_client_info
    end
  end
end
