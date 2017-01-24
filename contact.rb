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
    @@contacts.each do |i|
      puts i.first_name + " " + i.last_name
    end
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    i = @@contacts.find_index {|s| s.id == id}
    puts @@contacts[i].first_name + " " + @@contacts[i].last_name + " [#{id}]"
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  # This method allows update with a contact id
  # probably moving this to crm
  def self.update(id)
    i = @@contacts.find_index {|s| s.id == id}
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'

    puts case gets.chomp.to_i
    when 1
      puts "Current first name: " + @@contacts[i].first_name
      puts "Enter new first name:"
      @@contacts[i].first_name = gets.chomp
    when 2
      puts "Current last name:" + @@contacts[i].last_name
      puts "Enter new name:"
      @@contacts[i].last_name = gets.chomp
    when 3
      puts "Current email: " + @@contacts[i].email
      puts "Enter new email:"
      @@contacts[i].email = gets.chomp
    when 4
      puts "Current note: " + @@contacts[i].note
      puts "Enter new note:"
      @@contacts[i].note = gets.chomp
    else
      "Invalid option selected."
      Contact.update(id)
    end
  end

  def update

  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    #WIP
    i = @@contacts.find_index {|s| s.attribute == value}
    puts @@contacts[i].first_name + " " + @@contacts[i].last_name + " [#{id}]"
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def full_name
    puts @first_name + " " + @last_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  def self.foo(i)
    puts @@contacts[i].first_name
  end

  # Feel free to add other methods here, if you need them.

end


betty = Contact.create('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
timmy = Contact.create('Timmy', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
amy = Contact.create('Amy', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')

Contact.all
#Contact.update(2)
Contact.find_by(send(:first_name, "Betty"))
