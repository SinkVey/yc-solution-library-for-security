variable "BA_ID" {
  description = "billing account id"
  type = string
  default = ""
}

variable "ORG_ID" {
  description = "organization id"
  type    = string
  default = ""
}

variable "KEYCLOAK" {
  description = "install keycloak or no"
  type    = string
  default = ""
}

variable "ORG_ADMIN_FOLDER_ID" {
  description = "folder_id of first folder in org cloud"
  type    = string
  default = ""
}

variable "ORG_ADMIN_CLOUD_ID" {
  description = "cloud_id of first cloud"
  type    = string
  default = ""
}

variable "DNS_ZONE_NAME" {
  description = "name of dns zone in yandex cloud, not dns name"
  type    = string
  default = ""
}

variable "KC_FQDN" {
  description = "dns name of keycloak"
  type    = string
  default = ""
}


variable "CLOUD-LIST" {
  description = "List of Organization-level groups with their Roles"
  type = list(object(
    {
      name = string,
      descr = string,
      admin = string,
      folders = list(string)
    }
  ))
  default = [
    { 
        name = "web-app",
        descr = "web-app cloud",
        admin = "user1@example.com"
        folders = ["network", "prod", "nonprod", "dev"]
    },
    { 
        name = "mobile-app",
        descr = "mobile-app cloud",
        admin = "user2@example.com"
        folders = ["network", "prod", "nonprod", "dev"]
    },
    { 
        name = "security",
        descr = "security cloud",
        admin = "user3@example.com"
        folders = [""]
    }
]
}

variable "NETWORK-CLOUD_GROUPS" {
  description = "List of Groups that you want to pre-create for your clouds"
  type = list(object(
    {
      name = string,
      descr = string,
      roles = list(string)
    }
  ))
  default = [
    { 
        name = "network-viewer",
        descr = "admin who can view and monitor network",
        roles = ["vpc.viewer", "monitoring.admin"]
    },
    { 
        name = "gitlab-admin",
        descr = "admin who can administrate gitlab",
        roles = ["gitlab.admin"]
    }
]
}

variable "PROD-CLOUD_GROUPS" {
  description = "List of Groups that you want to pre-create for your clouds"
  type = list(object(
    {
      name = string,
      descr = string,
      roles = list(string)
    }
  ))
  default = [
    { 
        name = "prod-devops",
        descr = "devops prod",
        roles = ["k8s.viewer", "container-registry.viewer", "alb.viewer", "k8s.cluster-api.viewer", "vpc.user", "load-balancer.viewer", ]
    },
    { 
        name = "prod-sre",
        descr = "sre prod",
        roles = ["compute.viewer", "loadtesting.viewer", "storage.configViewer", "alb.viewer"]
    },
    { 
        name = "prod-dba",
        descr = "dba prod",
        roles = ["mdb.viewer", "ydb.viewer"]
    }
]
}

variable "NONPROD-CLOUD_GROUPS" {
  description = "List of Groups that you want to pre-create for your clouds"
  type = list(object(
    {
      name = string,
      descr = string,
      roles = list(string)
    }
  ))
  default = [
    { 
        name = "nonprod-devops",
        descr = "devops nonprod",
        roles = ["k8s.editor", "container-registry.editor", "alb.editor", "k8s.cluster-api.editor", "vpc.user", "load-balancer.admin", ]
    },
    { 
        name = "nonprod-sre",
        descr = "sre nonprod",
        roles = ["compute.operator", "loadtesting.editor", "storage.editor", "alb.editor"]
    },
    { 
        name = "nonprod-dba",
        descr = "dba nonprod",
        roles = ["mdb.admin", "ydb.editor"]
    }
]
}

variable "DEV-CLOUD_GROUPS" {
  description = "List of Groups that you want to pre-create for your clouds"
  type = list(object(
    {
      name = string,
      descr = string,
      roles = list(string)
    }
  ))
  default = [
    { 
        name = "dev-network",
        descr = "network dev",
        roles = ["vpc.admin", "monitoring.admin"]
    },
    { 
        name = "dev-devops",
        descr = "dev devops",
        roles = ["k8s.admin", "container-registry.admin", "alb.admin", "k8s.cluster-api.cluster-admin", "vpc.user", "iam.serviceAccounts.user"]
    }
]
}