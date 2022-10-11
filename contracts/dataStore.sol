// Store data point
//    A Unique Number(generated at contract deployment)
//     Account number (111111111)
//     Available balance ($150)
// Stored data is readable with just private key
// Only owner can call function to view data
// Data points can be viewed individually 




// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract dataStore {

    uint internal randomNumber;
    address owner;
    

    struct userData {
        uint uniqueID;
        bytes accountNumber;
        bytes availableBalance; 
    }

    userData[] private usersData;

    constructor () {
        // set owner 
        owner = msg.sender;

         // set the unique user ID
        generateID(); 


        // push the unique ID, number and balance into 
        // account number and available balance are encrypted and converted to bytes
        usersData.push(
            userData({
                uniqueID: randomNumber,
                accountNumber: "P1s9oyyr3m1KCWLft/Rwy8pcNCPfdUJvfNIZDzIChCXwOaa8TabiWmH4i3NXEsgu/beisDIRpTXsLIyRJreV6k/Td+ji6r37Gbp3GEY9X+9VWo2QOM2IaaeWYVuEM/fzlwR2YZKPG/Efkha/eCtCA0jgI/nC2/OCu2E0eJ9Vv1M=",
                availableBalance: "Dz0DhyuwbpXwu92DP406DBlIug27wB0lXFSAFOdloF3CMlu6SlNF+aDX8bQL14yZ7fTTmN1ln8IF7DJ3Z8AI6UIzteUIMcXUT/TM0Ou+P8/E3z9KorimFHM/LfA6yXCVkaeIK0pxbh/WvnNA+m3S5S/N/PUogTZB/L50GloxXKE="
            })
        );   
    }

    // Modifier allows only owner address to call functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    // generateID with keccak256
    function generateID () internal {

        randomNumber= uint (keccak256(abi.encodePacked(block.difficulty, msg.sender, block.timestamp)));
        
    }

    // View the user unique ID
    function getUniqueID () public view onlyOwner returns(uint) {
        userData storage UserData =  usersData[0];
        return UserData.uniqueID;
    }

    // View the user account number
    function getAccountNumber () public view onlyOwner returns(bytes memory) {
        userData storage UserData =  usersData[0];
        return UserData.accountNumber;
    }

    // View the user available balance
    function getAvailableBalance () public view onlyOwner returns(bytes memory) {
        userData storage UserData =  usersData[0];
        return UserData.availableBalance;
    }
    

}

// RSA encrypted
// 1024 bit

// public key
// MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCS+pEmFJX/IACZIgCxVPqDrIzKM7GJY2QhOHgjpQ3wKFWAB45L7F5Q/NBy5WVlszq4WMOHrKYSnWA8OW16mO0c8sGQavoSk7XVVsRBwnv8d6lV/AUK/8A0Fwh8nv0x33kq5euJl4yApasoGF5wPHmn76X293jE0YsGMlAeBIVzWQIDAQAB

// private key
// MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAJL6kSYUlf8gAJkiALFU+oOsjMozsYljZCE4eCOlDfAoVYAHjkvsXlD80HLlZWWzOrhYw4esphKdYDw5bXqY7RzywZBq+hKTtdVWxEHCe/x3qVX8BQr/wDQXCHye/THfeSrl64mXjIClqygYXnA8eafvpfb3eMTRiwYyUB4EhXNZAgMBAAECgYBiWAwE6eNPeM9Np0XFYfHZZvwxU5NoNTvLSqiAWTFRTvuele+td3PIRtEG/9zvxpP0w1fZkTjx3aGFynspe+ey3NgdVn9wOyLIePBfQO53CvI9AYuW5HeIEGlYx0VYzjJ9/7mGz+Pt94tBDzPkGS8WYlvlxUTYE1e4izxKsCnzgQJBAO5DbPHonj7dIUr1FtSAr0fJs/yZh5ifOAuuF9kbTRGLzYAjrS66EMdH1TkbzaViRd2SbdCdj5VMcD+0MetCGIkCQQCd64jtVo9RIiudZaDKTT4+yzHFLVYojKOchGcF155XzmM0f968grP9LpAIndtwkkrAUGzBSLVZG8ZSOtZrcjBRAkEAoTf8ar+k/BJyqZ6nYQjmEaQ45o4YQzxRFw4o0t33Sw0W80Kwt3JtUfqYG3llsCeL8L5ZEhTbCAHd3i0WrgJeSQJAAcVleLvyyYcnlBFSt1Icc5nVyg9TGwtQvm2htigP544yAKG6fsS8fgdqqB4VGvMZEYUVYymMlx4/oCZ2xye1sQJBALGEvLZUo9rax3uo7A2dSRY9UogNzSKK1T418o9e8/MkeMiOm72eY5xaR4njlGV3Px4si1WT4DKgp4YqV7JE3Xc=
