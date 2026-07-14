# Convert any numeric input to Decimal, Hex, Binary (auto-detect 0x, 0b, or plain number)
function conv() {
    local input=$1
    local dec

    if [[ -z $input ]]; then
        echo "Usage: conv <number>   e.g., conv 512  or  conv 0x200  or  conv 0b1000000000"
        return
    fi

    # Auto-detect input format
    if [[ $input =~ ^0x[0-9A-Fa-f]+$ ]]; then
        dec=$((16#${input#0x}))
    elif [[ $input =~ ^0b[01]+$ ]]; then
        dec=$((2#${input#0b}))
    elif [[ $input =~ ^[0-9]+$ ]]; then
        dec=$input
    else
        echo "Error: unrecognized format '$input'"
        return
    fi

    # Convert to binary (pure Bash, handles 0)
    local bin
    if [[ $dec -eq 0 ]]; then
        bin="0b0"
    else
        local n=$dec
        bin=""
        while [[ $n -gt 0 ]]; do
            bin=$((n % 2))$bin
            n=$((n / 2))
        done
        bin="0b$bin"
    fi

    # Output
    echo "Decimal: $dec"
    printf "Hex:     0x%X\n" $dec
    echo "Binary:  $bin"
}
