package main

import (
	"fmt"
	"testing"
)

func TestAdding(t *testing.T) {
	var tests = []struct {
		a, b int
		want int
	}{
		{1, 1, 2},
		{1, 0, 1},
		{23, -2, 21},
		{3, 4, 7},
		{-1, -90, -91},
	}
	for _, tt := range tests {
		fmt.Println()
		testname := fmt.Sprintf("%d,%d", tt.a, tt.b)
		t.Run(testname, func(t *testing.T) {
			ans := Adding(tt.a, tt.b)
			if ans != tt.want {
				t.Errorf("got %d, want %d", ans, tt.want)
			}
		})
	}
}
