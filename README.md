# Bivarus Code Project

## Guidance:

This project will introduce you to Bivarus and give you some background on some of the challenges we work on every day.

The deliverables for the project are:

 - Ruby code (either as a text file or a Git repo)
 - A conversation after

*Your code should use plain old Ruby classes and OOP (i.e. it’s not Rails, Active Model).*

Here’s a refresher on OOP SOLID: https://www.groupbuddies.com/posts/19-solid-principles-in-ruby

Don’t feel compelled to excessively comment your code, or to invest an extreme amount of time in the solution.  The conversation, and insight into the process you went through during design, is the most import part of the project.

## Background:

Bivarus helps customers measure and improve patient experience at health care providers.  So how do we measure a patient's experience?  One of the key ways we do that is by surveying patients.

The first step of the process of surveying is getting patient data from our customers.  Our customers (hospitals, clinics, etc) send us "encounters".  An encounter is a single visit to a healthcare provider, between one patient, and one or more staff members.

After receiving a set of encounters, we normalize the data contained in them, and send surveys to the patient that was associated with each encounter.

Here is a simplified encounter, as a Ruby hash:

```
{email: 'john@example.com', age: 32, drg: 100}
```

This indicates john@example.com showed up at a customer site and was treated.  At the time of the encounter they were 32 years old.  DRG is a code indicating the procedure the customer had during their visit.

Instructions:

Not all encounters we receive from customers are valid.

For this exercise you will create Ruby class(es) that accept an array of encounter hashes, and rejects invalid encounters based on their attributes.

Rules:

- patients with a DRG code of 200 should be rejected
- patients under the age of 18 should be rejected
- patients with no email are rejected
- patients previously seen (based on their email) should be rejected.  Only consider duplicates in regards to the encounters in the current batch you're processing.  Don't worry about what happens for batch + 1

So given the following test data:
[
  {email: 'alice@example.com', age: 32, drg: 100}, // valid encounter
  {email: 'sam@example.com', age: 32, drg: 200},   // rejected, bad drg
  {email: '', age: 32, drg: 100},                  // rejected, no email
  {email: 'alice@example.com', age: 32, drg: 100}, // rejected previously seen (same email)
  {email: 'bob@example.com', age: 17, drg: 100},   // rejected, too young
  {email: 'mallet@example.com', age: 20, drg: 500} // valid encounter
]

Your class/object should return a hash of valid and invalid encounters.
Invalid encounters should include a key with the specific error.

{
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

Bonus: create some test cases with more than one error.  For example an encounter might not have an email, and also have a bad DRG.  The invalid encounter's error key should then be an array containing a list of errors, instead of a single error.

Bonus: create unit tests for key methods in your class, using the framework of your choice



