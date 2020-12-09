# frozen_string_literal: true

class Seeds
  class << self
    include FactoryBot::Syntax::Methods

    def create_development_data(count = nil)
      create_suppliers(count || 1000)
      create_shippers(count || 100)
      create_categories(count || 100)

      create_customers(count || 1000)
      create_employees(count || 1000)

      create_products(count || 10_000)
      create_orders(count || 1000)
    end

    def create_suppliers(count = 1000)
      suppliers = Array.new(count) { attributes_for :supplier }

      import = Supplier.bulk_import suppliers
      create_addresses(import.ids, "Supplier")
    end

    def create_shippers(count = 100)
      shippers = Array.new(count) { attributes_for :shipper }

      import = Shipper.bulk_import shippers
      create_addresses(import.ids, "Shipper")
    end

    def create_categories(count = 100)
      categories = Array.new(count) { attributes_for :category }

      Category.bulk_import categories
    end

    def create_customers(count = 1000)
      customers = Array.new(count) { attributes_for :customer }

      import = Customer.bulk_import customers
      create_addresses(import.ids, "Customer")
    end

    def create_employees(count = 1000)
      employees = Array.new(count) { attributes_for :employee }

      import = Employee.bulk_import employees
      create_addresses(import.ids, "Employee")
    end

    def create_orders(count = 1000)
      products  = Product.all.pluck(:id)
      customers = Customer.all.pluck(:id)
      employees = Employee.all.pluck(:id)
      shippers  = Shipper.all.pluck(:id)

      orders = Array.new(count) do
        order = build :order, customer_id: customers.sample, employee_id: employees.sample, shipper_id: shippers.sample

        order.items = products.sample(rand(1..10)).map do |product_id|
          build :order_item, order: order, product_id: product_id
        end

        order
      end

      Order.bulk_import orders, recursive: true
    end

    def create_products(count = 10_000)
      suppliers  = Supplier.all.pluck(:id)
      categories = Category.all.pluck(:id)

      products = Array.new(count) do
        attributes_for :product,
                       category_id: categories.sample,
                       supplier_id: suppliers.sample
      end

      Product.bulk_import products
    end

    def create_addresses(ids, addressable_type)
      addresses = ids.map do |id|
        attributes_for(:address).merge(addressable_type: addressable_type, addressable_id: id)
      end

      Address.bulk_import addresses
    end
  end
end
