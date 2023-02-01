# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

Kind = "proxy-defaults"
Name = "global"

Config {
  envoy_prometheus_bind_addr = "0.0.0.0:9102"
  protocol = "http"
}