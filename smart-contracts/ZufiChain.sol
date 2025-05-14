// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ZufiChain {
    address public admin;

    enum Status { Created, Certified, Transported, Delivered }

    struct Batch {
        uint id;
        string crop;
        address certifier;
        string ipfsHash;
        uint timestamp;
        Status status;
    }

    mapping(uint => Batch) public batches;
    uint public nextId;

    constructor() {
        admin = msg.sender;
    }

    function createBatch(string memory crop) public {
        batches[nextId] = Batch(nextId, crop, address(0), "", block.timestamp, Status.Created);
        nextId++;
    }

    function certify(uint id, string memory ipfsHash) public {
        batches[id].certifier = msg.sender;
        batches[id].ipfsHash = ipfsHash;
        batches[id].status = Status.Certified;
    }
}
