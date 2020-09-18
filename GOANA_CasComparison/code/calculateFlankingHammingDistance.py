#!/usr/bin/env python3

import argparse
import sys

def main(argv):
    parser = argparse.ArgumentParser(description="Calculate hamming distance between two sequences")
    parser.add_argument("--input", help="Input file", required=True)
    parser.add_argument("--output", help="Output file", required=True)
    args = parser.parse_args()

    with open(args.input, 'r') as inFile, open(args.output, 'w') as outFile:
        for line in inFile:
            parts = line.rstrip().split()
            flank1 = parts[2]
            flank2 = parts[3]

            ham = 0

            for i in range(len(flank1)):
                if flank1[i] != flank2[i]:
                    ham = ham + 1

            parts.append(str(ham))
            print("\t".join(parts), file=outFile)

if __name__ == "__main__":
    main(sys.argv[1:])