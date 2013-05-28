jungle_japes = Company.create(
  name: 'Jungles Japes',
  website: 'opencode.ca',
)
angry_aztec = Company.create(
  website: 'http://angryaztec.com',
)
frantic_factory = Company.create(
  name: 'Frantic Factory',
)

User.new { |user|
  user.email = 'diddy@junglejapes.com'
  user.password = 'peanutpopguns'
  user.company = jungle_japes
}.save(validate: false)

User.new { |user|
  user.email = 'tiny@angryaztec.com'
  user.password = 'featherbow'
  user.company = angry_aztec
}.save(validate: false)

User.new { |user|
  user.email = 'lanky@angryaztec.com'
  user.password = 'grapeshooter'
  user.company = angry_aztec
}.save(validate: false)

User.new { |user|
  user.email = 'chunky@franticfactory.com'
  user.password = 'pineapplelauncher'
  user.company = frantic_factory
}.save(validate: false)
