FactoryGirl.define do |f|
	factory :page do 
		sequence(:title) {|i| "Title#{i}"}
		content (0..10_000).map{ ('a'..'z').to_a.concat([' '])[Kernel.rand(27)] }.join 
		published_on Time.now+(Kernel.rand(20)-10).days
	end
end