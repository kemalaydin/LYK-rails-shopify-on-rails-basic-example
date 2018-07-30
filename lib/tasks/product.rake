namespace :product do
    task :seed do
        Rake::Task["db:reset"].invoke

            product_names = %w(shirt jean short sock swim sweater jacket skirt dress vest swimsuit)
            variant_names = %w(small medium large)

            product_names.each.with_index(1) do |product_name, i|
            product = Product.create(name: product_name, price: i**4)
            variant_names.each do |variant_name|
                product.variants.create(name: variant_name, stock: 2*i)
            end
        end
    end
end
