# shellcheck shell=bash

helm.table() {
	p.fetch_github_release 'helm/helm' \
		| p.run_filter 'helm.jq'
	# TODO
	# p.fetch_github_release 'helm/helm' \
	# | p.run_filter 'github-release.jq' \
	# 	--arg global_variant 'Helm' \
	# 	--arg global_regex "^helm-(.*)-(?<os>.+)-(?<arch>.+?)\\."
}

helm.install() {
	local url="$1"
	local version="$2"

	p.fetch -o './helm.tar.gz' "$url"
	p.unpack './helm.tar.gz'

	p.ensure mv ./*/helm .
	p.ensure p.mkdir './dir/bin'
	p.ensure mv './helm' './dir/bin'

	REPLY_DIR='./dir'
	REPLY_BINS=('./bin')
}
