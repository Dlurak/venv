module genv

import os

const (
	w_dir = os.getwd()
	env_main = '.env'
)

pub fn load_env() {
	// mut envs := map[string]string

	// 
	env_path := os.join_path(w_dir, env_main)

	// check if .env exists in the working_dir
	if os.is_file(env_path) {
		// read each line of its content
		env_lines := os.read_lines(env_path) or {
			return
		}

		// parse each variables
		for i in env_lines{
			// defined variables should
			// be in the form VAR=value
			if '=' in i{
				var, value := split_slash(i)

				// set each env variable
				// defaults to override
				os.setenv(var, value, true)
			}
		}
	}
}

// splites the defined variable
fn split_slash(variable string) (string, string) {
	x := variable.split('=')
	return x[0], x[1]
}