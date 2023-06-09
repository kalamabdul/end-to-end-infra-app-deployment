pid_file = "./pidfile"

vault {
  address = "https://vault.kalamabdul.com:8200"
}

auto_auth {
  method "approle" {
    mount_path = "auth/approle"
      config = {
        role_id_file_path = "/tmp/app_role_id"
        secret_id_file_path = "/tmp/app_wrap_secret_id"
        remove_secret_id_file_after_reading = true
        secret_id_response_wrapping_path = "auth/approle/role/webblog-approle/secret-id"
    }
  }

  sink "file" {
    config = {
      path = "/tmp/vault_token"
      mode = 0644
      }
    }
}

cache {

}
api_proxy {
  use_auto_auth_token = "force"

}
listener "tcp" {
  address = "127.0.0.1:8007"
  tls_disable = true
}
