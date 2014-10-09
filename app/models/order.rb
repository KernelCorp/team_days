class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  STATUSES = %w(new in_progress close)

  field :cost, type: Float
  field :status, type: String

  embeds_one :client_info
  belongs_to :service
  belongs_to :partner, class_name: 'User::Partner'

  delegate :name, :email, :phone, to: :client_info, prefix: :client

  validates_presence_of :service, :client_info
  validate :ordered_services_is_supported_by_partner

  protected
  def ordered_services_is_supported_by_partner
    if partner.present? && !partner.support_service?(service)
      errors.add :service, I18n.t('service_not_supported')
    end
  end
end
