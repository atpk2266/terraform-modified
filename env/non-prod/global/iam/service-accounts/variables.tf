/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.project_id))
    error_message = "Project ID is invalid."
  }
}

variable "prefix" {
  type        = string
  description = "Prefix applied to service account names."
  default     = ""
}

variable "region" {
  description = "GCP region where the resource are present"
  type        = string
  validation {
    condition     = can(regex("^[a-z]([a-z0-9-])+([a-z0-9]+)$", var.region))
    error_message = "Region is invalid."
  }
}

variable "display_name" {
  type        = string
  description = "Display names of the created service accounts (defaults to 'Terraform-managed service account')"
  default     = "Terraform-managed service account"
}

variable "description" {
  type        = string
  description = "Default description of the created service accounts (defaults to no description)"
  default     = ""
}

variable "project_roles" {
  type        = list(string)
  description = "Common roles to apply to all service accounts, project=>role as elements."
  default     = []
}
