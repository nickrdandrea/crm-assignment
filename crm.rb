require_relative 'contact'

class CRM

  def initialize
    main_menu
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print 'Enter Contact ID:'
    id = gets.chomp.to_i

    c = Contact.find(id)
    puts 'Contact Selected: ' + c.full_name

    puts 'Select Attribute to Modify:'
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'
    user_selected = gets.chomp.to_i

    print 'Enter New Value:'
    value = gets.chomp

    case user_selected
    when 1 then attribute = "first_name"
    when 2 then attribute = "last_name"
    when 3 then attribute = "email"
    when 4 then attribute = "note"
    end

    c.update(attribute, value)
  end

  def delete_contact
    print 'Enter Contact ID:'
    id = gets.chomp.to_i
    Contact.find(id).delete
  end

  def display_all_contacts
    Contact.all
  end

  def search_by_attribute
    puts 'Select Attribute to Search By:'
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] Email'
    puts '[4] Note'
    user_selected = gets.chomp.to_i

    print 'Enter Search Value:'
    value = gets.chomp

    case user_selected
    when 1 then attribute = "first_name"
    when 2 then attribute = "last_name"
    when 3 then attribute = "email"
    when 4 then attribute = "note"
    end

    puts Contact.find_by(attribute, value).full_name
  end


end

a_crm_app = CRM.new
a_crm_app.main_menu
