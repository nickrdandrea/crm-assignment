# MiniTest Results
# Run options: --seed 8873

# Running:

# ..Grace Hopper
# .....

# Fabulous run in 0.000907s, 7715.1735 runs/s, 7715.1735 assertions/s.

# 7 runs, 7 assertions, 0 failures, 0 errors, 0 skips

class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts.each {|i| puts i.first_name + " " + i.last_name}
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.find_index {|s| return s if s.id == id}
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    self.send("#{attribute}=", value)
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @@contacts.find { |c|  return c if c.send(attribute).upcase == value.upcase }
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    @first_name + " " + @last_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end
  # Feel free to add other methods here, if you need them.
end


betty = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
timmy = Contact.create('Timmy', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
amy = Contact.create('Amy', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
