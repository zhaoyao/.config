function proxy_on {
	export http_proxy=http://127.0.0.1:8016
	export https_proxy=http://127.0.0.1:8016
}

function proxy_off {
	unset http_proxy
	unset https_proxy
}
