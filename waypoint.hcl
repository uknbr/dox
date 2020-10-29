project = "dox"

labels = { "Event" = "SeComp", "Location" = "UFSCar" }

app "dox" {
    build {
        use "docker" {
        }
    }

    deploy {
        use "docker" {
        }
    }
}