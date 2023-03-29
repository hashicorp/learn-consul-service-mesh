#!/bin/bash
# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0


docker-compose down --remove-orphans
docker network rm learn-consul-service-mesh_vpcbr