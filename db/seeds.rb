# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# cities_with_state = "New York, New York; Los Angeles, California; Chicago, Illinois; Houston, Texas; Philadelphia, Pennsylvania; Phoenix, Arizona; San Diego, California; San Antonio, Texas; Dallas, Texas; Detroit, Michigan; San Jose, California; Indianapolis, Indiana; Jacksonville, Florida; San Francisco, California; Columbus, Ohio; Austin, Texas; Memphis, Tennessee; Baltimore, Maryland; Charlotte, North Carolina; Fort Worth, Texas; Boston, Massachusetts; Milwaukee, Wisconsin; El Paso, Texas; Washington, District of Columbia; Nashville-Davidson, Tennessee; Seattle, Washington; Denver, Colorado; Las Vegas, Nevada; Portland, Oregon; Oklahoma City, Oklahoma; Tucson, Arizona; Albuquerque, New Mexico; Atlanta, Georgia; Long Beach, California; Kansas City, Missouri; Fresno, California; New Orleans, Louisiana; Cleveland, Ohio; Sacramento, California; Mesa, Arizona; Virginia Beach, Virginia; Omaha, Nebraska; Colorado Springs, Colorado; Oakland, California; Miami, Florida; Tulsa, Oklahoma; Minneapolis, Minnesota; Honolulu, Hawaii; Arlington, Texas; Wichita, Kansas; St. Louis, Missouri; Raleigh, North Carolina; Santa Ana, California; Cincinnati, Ohio; Anaheim, California; Tampa, Florida; Toledo, Ohio; Pittsburgh, Pennsylvania; Aurora, Colorado; Bakersfield, California; Riverside, California; Stockton, California; Corpus Christi, Texas; Lexington-Fayette, Kentucky; Buffalo, New York; St. Paul, Minnesota; Anchorage, Alaska; Newark, New Jersey; Plano, Texas; Fort Wayne, Indiana; St. Petersburg, Florida; Glendale, Arizona; Lincoln, Nebraska; Norfolk, Virginia; Jersey City, New Jersey; Greensboro, North Carolina; Chandler, Arizona; Birmingham, Alabama; Henderson, Nevada; Scottsdale, Arizona; North Hempstead, New York; Madison, Wisconsin; Hialeah, Florida; Baton Rouge, Louisiana; Chesapeake, Virginia; Orlando, Florida; Lubbock, Texas; Garland, Texas; Akron, Ohio; Rochester, New York; Chula Vista, California; Reno, Nevada; Laredo, Texas; Durham, North Carolina; Modesto, California; Huntington, New York; Montgomery, Alabama; Boise, Idaho; Arlington, Virginia; San Bernardino, California".split("; ")

city_with_state = "Boulder, Colorado"

# cities_with_state.each do |cs|
  city_and_state = city_with_state.split(',')
  sleep 0.5
  Location.create(city: city_and_state.first, state: city_and_state.last)
# end