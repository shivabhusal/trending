Geocoder.configure(:lookup => :test)
stub_data = "New York, NY", [
    {
      'latitude'     => 40.7143528,
      'longitude'    => -74.0059731,
      'address'      => 'New York, NY, USA',
      'state'        => 'New York',
      'state_code'   => 'NY',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
Geocoder::Lookup::Test.add_stub(stub_data)
Geocoder::Lookup::Test.set_default_stub(stub_data)
