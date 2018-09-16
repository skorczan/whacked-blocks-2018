pragma solidity ^0.4.0;


import "./AddressArrays.sol"


contract IdentityToken {

    using AddressArrays for address[];

    bytes32 id;
    address[] requestors;
    mapping (address => address[]) approversOf;
    mapping (address => mapping (address => uint)) approverOf;

    constructor(bytes32 _id) {
        id = _id;
    }

    function approve(address _requestor) public {
        if (approversOf[_requestor].length == 0) {
            requestors.push(_requestor);
        }

        if (approverOf[_requestor][self.msg.sender] == 0) {
            approversOf[_requestor].push(msg.sender);
        }

        approverOf[_requestor][self.msg.sender] += 1;
    }

    function revokeApproval(address _requestor) public {
        approverOf[_requestor][self.msg.sender] -= 1;

        if (approverOf[_requestor][self.msg.sender] == 0) {
            approversOf[_requestor].remove(_requestor)
        }

        if (approversOf[_requestor].length == 0) {
           requestors.remove(_requestor);
        }
    }
}
