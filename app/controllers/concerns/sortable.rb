module Sortable
  extend ActiveSupport::Concern

  protected
  def order_option
    if params[:order].present?
      params[:order] =~ /^([\w\_\.]+)(->'\w+')?_(desc|asc)$/
      field = $1
      order = $3
      return "#{field} #{order}" if field.present? && order.present?
    end
    ''
  end


end