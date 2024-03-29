# All generic output goes here

locals {
  ssh_key_i = format(
    " %s%s ",
    var.ssh_config_pubkey_file != "" ? "-i " : "",
    var.ssh_config_pubkey_file != "" ? replace(var.ssh_config_pubkey_file, ".pub", "") : "",
  )
}

data "null_data_source" "group_hostnames_and_ips" {
  count = local.kdevops_num_boxes
  inputs = {
    value = format(
      "%30s  :  ssh %s@%s %s ",
      element(var.kdevops_nodes, count.index),
      var.ssh_config_user,
      element(aws_eip.kdevops_eip.*.public_ip, count.index),
      local.ssh_key_i,
    )
  }
}

output "login_using" {
  value = data.null_data_source.group_hostnames_and_ips.*.outputs
}

