# Red Hat CloudForms Automate Method
# Use the following command to inspect the request fields using request id <1234000000000083>
# rails runner tools/rebuild_provision_request.rb -r 1234000000000083 -q
#
$evm.log("info", "Red Hat CloudForms Automate Method  Building VM Provisioning Request Started")
#
 
prov= $evm.root['miq_provision']

  # arg1 = version
  args = ['1.1']
  # arg2 = templateFields
  args << {'name' => 'centos-7-x86_64'}
  # arg3 = vmFields
  # Disable placement_auto, otherwise set to true
  args << {'vm_name' => 'CRM_APP', 'request_type' => 'template', 'instance_type' => '1234000000000015', 'placement_auto' => 'false', 'cloud_network' => '1234000000000005', 'cloud_tenant' => '1234000000000002'}
  # arg4 =  requester
  args << {'owner_email' => 'admin@asd.com', 'owner_last_name' => 'Admin', 'owner_first_name' => 'Admin', 'user_name' => 'admin'}
  # arg5 =  tags
  args << nil
  # arg6 =  WS Values
  args << nil
  # arg7 = emsCustomAttributes
  args << nil
  # arg8 = miqCustomAttributes
  args << nil
$evm.log("info","Building provisioning request with the following arguments: <#{args.inspect}>")
result = $evm.execute('create_provision_request', *args)
