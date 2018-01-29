# Copyright 2018 Grabtaxi Holdings PTE LTE (GRAB), All rights reserved.
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file

# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [:password]
