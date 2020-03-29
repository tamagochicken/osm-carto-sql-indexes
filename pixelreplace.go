package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

// from openstreetmap-carto -> indexes.sql -> CREATE INDEX planet_osm_polygon_way_area_z6
const z10pixelWH float64 = 9700 //9783.94

func main() {

	// read template
	scanner := bufio.NewScanner(os.Stdin)
	lines := make([]string, 0)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}

	// calc endzoom
	args := os.Args[1:]
	var minzoom, maxzoom int
	if len(args) > 0 {
		var err error
		minzoom, err = strconv.Atoi(args[0])
		if err != nil {
			fmt.Fprintln(os.Stderr, "error parsing number for minzoom:", err)
			os.Exit(1)
		}
		if len(args) > 1 {
			var err error
			maxzoom, err = strconv.Atoi(args[1])
			if err != nil {
				fmt.Fprintln(os.Stderr, "error parsing number for maxzoom:", err)
				os.Exit(1)
			}
		} else {
			maxzoom = 6
		}

	} else {
		minzoom = 30
		maxzoom = 0
	}

	// stdout
	for zoom := maxzoom; zoom <= minzoom; zoom++ {
		pixelWHnumber := z10pixelWH * math.Pow(2, 10-float64(zoom))
		pixelWH := strconv.Itoa(int(pixelWHnumber))
		for _, line := range lines {
			newline := strings.ReplaceAll(line, "!pixel_width!", pixelWH)
			newline = strings.ReplaceAll(newline, "!pixel_height!", pixelWH)
			fmt.Println(newline)
		}
		if pixelWHnumber == 0 {
			break
		}
	}
}
