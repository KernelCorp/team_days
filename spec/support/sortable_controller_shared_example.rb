RSpec.shared_examples 'sortable controller' do
  describe 'sorting' do
    it 'sorts asc' do
      get :index, {order: "#{sorting_field}_asc"}
      expect(assigns(model_name.downcase.pluralize).to_a).to eq(model_name.constantize.order("#{sorting_field} asc").to_a)
    end
    it 'sorts desc' do
      get :index, {order: "#{sorting_field}_desc"}
      expect(assigns(model_name.downcase.pluralize).to_a).to eq(model_name.constantize.order("#{sorting_field} desc").to_a)
    end
  end
end