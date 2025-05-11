#!/bin/bash

export OLLAMA_HOST="http://0.0.0.0:11434"
export OLLAMA_MODELS="$(dirname $0)/models"

ollama serve
