User.new { |user|
  user.email = 'diddy@junglejapes.com'
  user.password = 'peanutpopguns'
}.save(validate: false)

User.new { |user|
  user.email = 'tiny@angryaztec.com'
  user.password = 'featherbow'
}.save(validate: false)

User.new { |user|
  user.email = 'lanky@angryaztec.com'
  user.password = 'grapeshooter'
}.save(validate: false)

User.new { |user|
  user.email = 'chunky@franticfactory.com'
  user.password = 'pineapplelauncher'
}.save(validate: false)
