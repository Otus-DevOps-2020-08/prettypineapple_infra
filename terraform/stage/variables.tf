variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1"
}
variable instance_zone {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west1-b"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "app-base-1604675300"
}
variable db_disk_image {
  description = "Disk image for mongodb"
  default = "mongodb-base-1604675766"
}
