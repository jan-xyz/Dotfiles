function docker --wraps=podman --description 'alias docker=podman'
  podman $argv
        
end
