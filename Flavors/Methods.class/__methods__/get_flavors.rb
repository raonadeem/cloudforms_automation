def get_flavor
  flavor_names = []
  flavors = $evm.vmdb('flavor').all
  flavors.each do |flavor|
    flavor_names << flavor.name
  end
  return flavor_names
end

flavor_names_list = get_flavor
$evm.log(:info, "Flavors list is: #{flavor_names_list}")
flavor_names_hash = Hash[(0...flavor_names_list.size).zip flavor_names_list]

dropdn_field = {
  "sort_by" => "value",
  "sort_order" => "ascending",
  "data_type" => "integer",
  "required" => true,
  "values" => flavor_names_hash
  }
dropdn_field.each {|key, value| $evm.object[key] = value}
# Added for REST API calls to return the result
automation_request = $evm.root['automation_task'].automation_request
automation_request.set_option(:return, JSON.generate({:status => 'success', :return => flavor_names_hash}))
exit MIQ_OK
