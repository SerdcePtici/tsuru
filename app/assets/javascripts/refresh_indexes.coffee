@refresh_inputs_indexes = (inputs) ->
  console.log 'length', inputs.length
  inputs.each (index, input) ->
    input.name = input.name.replace /\[\d+\]/, "[#{index}]"
    input.id = input.id.replace /_\d+_/, "_#{index}_"