// Copyright © 2017 NAME HERE <EMAIL ADDRESS>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

// buildCmd represents the build command
var buildCmd = &cobra.Command{
	Use:   "build",
	Short: "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("build called")

		var cmdStr string =
` ###
# Build Env
###
_build_container() {
# allow to pick between a few different docker files? or maybe provide a dockerfile name?

  docker build   \
  -t dotfilesdev \
  --build-arg NAME=$name_passed_in \
  --build-arg HTTP_PROXY=$http_proxy   \
  --build-arg http_proxy=$http_proxy   \
  --build-arg HTTPS_PROXY=$https_proxy \
  --build-arg https_proxy=$https_proxy \
  ./
    #-t dotfilesDev$(date -u +"%y%m%d%H%M%S") \
  #--build-arg NAME=$name_passed_in \
  #$@

}`
    fmt.Printf("%s", cmdStr)


// config file example

viper.SetConfigName("devFile")
viper.AddConfigPath(".")
viper.AddConfigPath("~/")
viper.AddConfigPath("$HOME/.devBuilder")

err := viper.ReadInConfig() // Find and read the config file
if err != nil { // Handle errors reading the config file
	  panic(fmt.Errorf("Fatal error config file: %s \n", err))
}

fmt.Println("\n\nProvider:" + viper.GetString("provider") + "\n[options are: docker, virtualbox, EC2]")





	},
}

func init() {
	rootCmd.AddCommand(buildCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// buildCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// buildCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
