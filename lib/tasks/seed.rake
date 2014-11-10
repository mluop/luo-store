namespace :seed do
  desc "TODO"
  task data: :environment do
    for i in 0..100
      Product.create(name:"product#{i}", price:i)
    end
  end

end
