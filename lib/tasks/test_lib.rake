Rails::TestTask.new('test:lib' => 'test:prepare') do |t|
  t.pattern = 'test/lib/*_test.rb'
end

Rake::Task['test:run'].enhance ['test:lib']
