require './contact.rb'
require "yaml"

class AddressBook
  attr_reader :contacts

  def initialize
    @contacts = []
    open()
  end

  def open
    @contacts = YAML.load_file('contacts.yml') if File.exists?('contacts.yml')
  end

  def save
    File.open('contacts.yml', 'w') { |file| file.write(contacts.to_yaml) }
  end

  def run
    loop do
      puts 'Address Book'
      puts 'a: Add Contact'
      puts 'p: Print Address Book'
      puts 'e: Exit'
      print 'Enter your choice: '
      input = gets.chomp.downcase
      case input
      when 'a'
        add_contact
      when 'p'
        print_contact_list
      when 'e'
        save()
        break
      end
    end
  end

  def add_contact
    contact = Contact.new
    print "First name: "
    contact.first_name = gets.chomp
    print "Middle name: "
    mn = gets.chomp
    if mn == ''
      contact.middle_name = nil
    else
      contact.middle_name = mn
    end
    print "Last name: "
    contact.last_name = gets.chomp

    loop do
      puts "Add phone number or address?"
      puts "p: Add phone number"
      puts "a: Add address"
      puts "(Any other key to go back)"
      response = gets.chomp.downcase
      case response
      when 'p'
        print "Phone number kind (Home, Work, etc): "
        kind = gets.chomp
        print "Number: "
        number = gets.chomp
        phone = PhoneNumber.new(kind, number)
        contact.phone_numbers.push(phone)
      when 'a'
        address = Address.new
        print "Address kind (Home, Work, etc): "
        address.kind = gets.chomp
        print "Address line 1: "
        address.street_1 = gets.chomp
        print "Address line 2: "
        address.street_2 = gets.chomp
        print "City: "
        address.city = gets.chomp
        print "State: "
        address.state = gets.chomp
        print "Postal code: "
        address.postal_code = gets.chomp
        contact.addresses.push(address)
      else
        print "\n"
        break
      end
    end

    contacts.push(contact)
  end

  def print_contact_list
    puts '-' * 30
    puts 'Contact List'
    contacts.each { |contact| puts contact.to_s('last_first') }
    puts '-' * 30
  end

end

address_book = AddressBook.new
address_book.run