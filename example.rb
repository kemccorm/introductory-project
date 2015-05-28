encounters = [
  {email: 'alice@example.com', age: 32, drg: 100}, // valid encounter
  {email: 'sam@example.com', age: 32, drg: 200},   // rejected, bad drg
  {email: '', age: 32, drg: 100},                  // rejected, no email
  {email: 'alice@example.com', age: 32, drg: 100}, // rejected previously seen (same email)
  {email: 'bob@example.com', age: 17, drg: 100},   // rejected, too young
  {email: 'mallet@example.com', age: 20, drg: 500} // valid encounter
]

expected_results = {
  valid: [
    {email: 'alice@example.com', age: 32, drg: 100},
    {email: 'mallet@example.com', age: 20, drg: 500}
  ],
  invalid: [
    {email: 'sam@example.com', age: 32, drg: 200, error: 'bad drg'},
    {email: '', age: 32, drg: 100, error: 'no email'},
    {email: 'alice@example.com', age: 32, drg: 100, error: 'previously seen'},
    {email: 'bob@example.com', age: 17, drg: 100, error: 'too young'}
  ]
}

mc = MyCreativeClassName.new
results = mc.my_creative_method_name(encounters)

if expected_results == results
  puts "Success"
else
  puts "Failure"
end
