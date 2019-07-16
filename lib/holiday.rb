require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each {|key, value| value.push(supply)}
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season.to_sym][holiday_name.to_sym] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].map {|season, supplies| supplies}.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |key, value|
    puts key.to_s.tr("_", " ").split(/(\W)/).map(&:capitalize).join + ":"
    value.each do |key, value|
      puts "  " + key.to_s.tr("_", " ").split(/(\W)/).map(&:capitalize).join + ": " + value.join(", ")
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  bbq_array = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
        if supplies.include?("BBQ") 
         bbq_array.push(holiday)
        end 
    end
  end
  bbq_array
end