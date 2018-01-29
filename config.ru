# Copyright 2018 Grabtaxi Holdings PTE LTE (GRAB), All rights reserved.
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
