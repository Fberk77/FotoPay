// Copyright 2023 gRPC authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
// Automatically generated by tools/codegen/core/gen_config_vars.py
//

#ifndef GRPC_SRC_CORE_LIB_CONFIG_CONFIG_VARS_H
#define GRPC_SRC_CORE_LIB_CONFIG_CONFIG_VARS_H

#include <stdint.h>

#include <atomic>
#include <string>

#include "absl/strings/string_view.h"
#include "absl/types/optional.h"

#include <grpc/support/port_platform.h>

namespace grpc_core {

class GPR_DLL ConfigVars {
 public:
  struct Overrides {
    absl::optional<int32_t> client_channel_backup_poll_interval_ms;
    absl::optional<bool> enable_fork_support;
    absl::optional<bool> abort_on_leaks;
    absl::optional<bool> not_use_system_ssl_roots;
    absl::optional<std::string> dns_resolver;
    absl::optional<std::string> verbosity;
    absl::optional<std::string> stacktrace_minloglevel;
    absl::optional<std::string> poll_strategy;
    absl::optional<std::string> system_ssl_roots_dir;
    absl::optional<std::string> default_ssl_roots_file_path;
    absl::optional<std::string> ssl_cipher_suites;
    absl::optional<std::string> experiments;
    absl::optional<std::string> trace;
  };
  ConfigVars(const ConfigVars&) = delete;
  ConfigVars& operator=(const ConfigVars&) = delete;
  // Get the core configuration; if it does not exist, create it.
  static const ConfigVars& Get() {
    auto* p = config_vars_.load(std::memory_order_acquire);
    if (p != nullptr) return *p;
    return Load();
  }
  static void SetOverrides(const Overrides& overrides);
  // Drop the config vars. Users must ensure no other threads are
  // accessing the configuration.
  static void Reset();
  std::string ToString() const;
  // A comma separated list of currently active experiments. Experiments may be
  // prefixed with a '-' to disable them.
  absl::string_view Experiments() const { return experiments_; }
  // Declares the interval in ms between two backup polls on client channels.
  // These polls are run in the timer thread so that gRPC can process connection
  // failures while there is no active polling thread. They help reconnect
  // disconnected client channels (mostly due to idleness), so that the next RPC
  // on this channel won't fail. Set to 0 to turn off the backup polls.
  int32_t ClientChannelBackupPollIntervalMs() const {
    return client_channel_backup_poll_interval_ms_;
  }
  // Declares which DNS resolver to use. The default is ares if gRPC is built
  // with c-ares support. Otherwise, the value of this environment variable is
  // ignored.
  absl::string_view DnsResolver() const { return dns_resolver_; }
  // A comma separated list of tracers that provide additional insight into how
  // gRPC C core is processing requests via debug logs.
  absl::string_view Trace() const { return trace_; }
  // Logging verbosity.
  absl::string_view Verbosity() const { return verbosity_; }
  // Messages logged at the same or higher level than this will print stacktrace
  absl::string_view StacktraceMinloglevel() const {
    return stacktrace_minloglevel_;
  }
  // Enable fork support
  bool EnableForkSupport() const { return enable_fork_support_; }
  // Declares which polling engines to try when starting gRPC. This is a
  // comma-separated list of engines, which are tried in priority order first ->
  // last.
  absl::string_view PollStrategy() const { return poll_strategy_; }
  // A debugging aid to cause a call to abort() when gRPC objects are leaked
  // past grpc_shutdown()
  bool AbortOnLeaks() const { return abort_on_leaks_; }
  // Custom directory to SSL Roots
  std::string SystemSslRootsDir() const;
  // Path to the default SSL roots file.
  std::string DefaultSslRootsFilePath() const;
  // Disable loading system root certificates.
  bool NotUseSystemSslRoots() const { return not_use_system_ssl_roots_; }
  // A colon separated list of cipher suites to use with OpenSSL
  absl::string_view SslCipherSuites() const { return ssl_cipher_suites_; }

 private:
  explicit ConfigVars(const Overrides& overrides);
  static const ConfigVars& Load();
  static std::atomic<ConfigVars*> config_vars_;
  int32_t client_channel_backup_poll_interval_ms_;
  bool enable_fork_support_;
  bool abort_on_leaks_;
  bool not_use_system_ssl_roots_;
  std::string dns_resolver_;
  std::string verbosity_;
  std::string stacktrace_minloglevel_;
  std::string poll_strategy_;
  std::string ssl_cipher_suites_;
  std::string experiments_;
  std::string trace_;
  absl::optional<std::string> override_system_ssl_roots_dir_;
  absl::optional<std::string> override_default_ssl_roots_file_path_;
};

}  // namespace grpc_core

#endif  // GRPC_SRC_CORE_LIB_CONFIG_CONFIG_VARS_H
