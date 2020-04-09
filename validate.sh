#!/bin/sh

circleci config pack src | circleci orb validate -
