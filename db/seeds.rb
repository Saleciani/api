puts "Wiping DB clean..."

Port.delete_all
Admin.delete_all


Admin.create(
  username:"JoaoLobo",
  password:"12345"
)
Admin.create(
  username:"SHYPPLE",
  password:"12345"
)

# frozen_string_literal: true
Port.create(
  nr: 4747,
  name: 'Aeropuerto General Tomas de Heres Ciudad Bolivar',
  code: 'CBL',
  city: '17',
  oceaninsightscode: 'hey',
  latitude: 8.12216091156,
  longitude: -63.5369567871,
  bigschedules: 'ka',
  createdat: 2017 - 12 - 31,
  updatedat: 2017 - 12 - 31,
  porttype: 'airport',
  hubport: false,
  oceaninsights: 'koko'
)
Port.create(
  nr: 4746,
  name: 'Aeropuerto General Tomas de Heres Ciudad Bolivar',
  code: 'CssBL',
  city: '17',
  oceaninsightscode: 'ziziziiz',
  latitude: 8.12216091156,
  longitude: -63.5369567871,
  bigschedules: 'ka',
  createdat: 2017 - 12 - 31,
  updatedat: 2017 - 12 - 31,
  porttype: 'airport',
  hubport: false,
  oceaninsights: 'koko'
)
