import Foundation
import ArgumentParser

struct Completion: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Generate shell completion scripts"
    )
    
    @Argument(help: "Shell type (bash, zsh, fish)")
    var shell: String
    
    func run() throws {
        switch shell.lowercased() {
        case "bash":
            print(bashCompletion)
        case "zsh":
            print(zshCompletion)
        case "fish":
            print(fishCompletion)
        default:
            CLIOutput.warn("Error", "Unsupported shell: \(shell)")
            CLIOutput.hint("Supported shells: bash, zsh, fish")
            throw ExitCode.failure
        }
    }
    
    private var bashCompletion: String {
        """
        # Flying Dutchman bash completion
        _fd_completion() {
            local cur prev opts
            COMPREPLY=()
            cur="${COMP_WORDS[COMP_CWORD]}"
            prev="${COMP_WORDS[COMP_CWORD-1]}"
            
            opts="start stop containers images stacks volumes networks machines k8s events config version doctor"
            
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
        }
        complete -F _fd_completion fd
        """
    }
    
    private var zshCompletion: String {
        """
        #compdef fd
        
        _fd() {
            local -a commands
            commands=(
                'start:Start the Flying Dutchman engine'
                'stop:Stop the Flying Dutchman engine'
                'containers:Manage containers'
                'images:Manage images'
                'stacks:Manage stacks'
                'volumes:Manage volumes'
                'networks:Manage networks'
                'machines:Manage Linux machines'
                'k8s:Manage Kubernetes clusters'
                'events:Stream container events'
                'config:Manage configuration'
                'version:Show version information'
                'doctor:Run diagnostics'
            )
            
            _describe 'command' commands
        }
        
        _fd
        """
    }
    
    private var fishCompletion: String {
        """
        # Flying Dutchman fish completion
        complete -c fd -f
        
        complete -c fd -n "__fish_use_subcommand" -a start -d "Start the Flying Dutchman engine"
        complete -c fd -n "__fish_use_subcommand" -a stop -d "Stop the Flying Dutchman engine"
        complete -c fd -n "__fish_use_subcommand" -a containers -d "Manage containers"
        complete -c fd -n "__fish_use_subcommand" -a images -d "Manage images"
        complete -c fd -n "__fish_use_subcommand" -a stacks -d "Manage stacks"
        complete -c fd -n "__fish_use_subcommand" -a volumes -d "Manage volumes"
        complete -c fd -n "__fish_use_subcommand" -a networks -d "Manage networks"
        complete -c fd -n "__fish_use_subcommand" -a machines -d "Manage Linux machines"
        complete -c fd -n "__fish_use_subcommand" -a k8s -d "Manage Kubernetes clusters"
        complete -c fd -n "__fish_use_subcommand" -a events -d "Stream container events"
        complete -c fd -n "__fish_use_subcommand" -a config -d "Manage configuration"
        complete -c fd -n "__fish_use_subcommand" -a version -d "Show version information"
        complete -c fd -n "__fish_use_subcommand" -a doctor -d "Run diagnostics"
        """
    }
}
