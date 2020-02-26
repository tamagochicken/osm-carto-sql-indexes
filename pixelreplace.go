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
	lines := make([]string, 100)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	if err := scanner.Err(); err != nil {
		fmt.Fprintln(os.Stderr, "error:", err)
		os.Exit(1)
	}

	// calc endzoom
	arg1 := os.Args[1:]
	var minzoom int
	if len(arg1) > 0 {
		var err error
		minzoom, err = strconv.Atoi(arg1[0])
		if err != nil {
			fmt.Fprintln(os.Stderr, "error parsing number:", err)
			os.Exit(1)
		}
	} else {
		minzoom = 12
	}

	// stdout
	for zoom := 6; zoom <= minzoom; zoom++ {
		pixelWH := strconv.Itoa(int(z10pixelWH * math.Pow(2, 10-float64(zoom))))
		for _, line := range lines {
			newline := strings.ReplaceAll(line, "!pixel_width!", pixelWH)
			newline = strings.ReplaceAll(newline, "!pixel_height!", pixelWH)
			fmt.Println(newline)
		}
	}
}
