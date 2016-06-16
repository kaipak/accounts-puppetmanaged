# Profile to call accounts module
class profile::accounts {
    $users = hiera(accounts)
    create_resources(accountspkg::account, $users)
}
