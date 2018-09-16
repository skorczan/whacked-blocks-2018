pragma solidity ^0.4.0;


library AddressArrays {

    function swap(address[] addresses, uint i, uint j) {
        address tmp = addresses[i];
        addresses[i] = addresses[j];
        addresses[j] = tmp;
    }

    function sort(address[] addresses) {
        for (uint i = 1 ; i < addresses.length; i++) {
            uint j = i;

            while ( --j > 0 && addresses[j] > addresses[j+1]) {
                swap(addresses, j+1, j);
            }
        }
    }

    function add(address[] addresses, address item) {
        addresses.push(item);
        sort(addresses);
    }

    function remove(address[] addresses, address item) {
        for (uint i = 0; i < addresses.length; ++i) {
            if (addresses[i] == item) {
                swap(addresses, i, addresses.length);
                addresses.length--;
                return;
            }
        }
    }
}
