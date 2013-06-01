# HipChat functions
# t.r.parkinson@sheffield.ac.uk
#-requires version 3.0

#region Helpers
# TODO: just use -Test params on the functions
function Test-HipChatMethodAllowed {
throw "not implemented yet"
}

function Test-HipChatRate {
throw "not implemented yet"
}

function Initialize-HipChat {
throw "not implemented yet"
}

#endregion

#region Room API
function Send-HipChatMessage {
<#
#>
    [CmdletBinding()]

    param(
        [Parameter(Position=0,
                   ValueFromPipeline=$true,
                   Mandatory=$true)]
        [ValidateLength(1,10000)]
        [String]$Message,
        [Parameter(Position=1)]
        [String]$Room,
        [Parameter(Position=2)]
        [ValidateLength(1,15)]
        [ValidatePattern('^[a-zA-Z_\-\s\d]*$')]
        [String]$From='Powershell',
        [Parameter(Position=3)]
        [ValidateSet('html','text')]
        [String]$MessageFormat = 'text',
        [Parameter(Position=4)]
        [ValidateSet('json','xml')]
        [String]$ResponseFormat = 'json',
        [Parameter(Position=5)]
        [ValidateSet('yellow','red','green','purple','gray','random')]
        [Alias('Color')]
        [String]$Colour,
        [Parameter(Position=6)]
        [Switch]$Notify,
        [Parameter(Position=7)]
        [String]$Endpoint = 'https://api.hipchat.com/v1/rooms/message',
        [Parameter(Position=8)]
        [String]$Token = $script:Token

    )

    begin {
        Write-Verbose "Constructing API Url for message send"
        $url = "$($Endpoint)?format=$ResponseFormat&auth_token=$Token"
        Write-Verbose "URL: $url"

        if ($Notify) {
            [Int32]$Notify = 1
        }

    }

    process {
        Write-Verbose "Constructing body of request"
        $body = @{
            'room_id'=$Room
            'from'=$From
            'message'=$Message
            'message_format'=$MessageFormat
            'notify'=$Notify
            'color'=$colour
            'format'=$ResponseFormat
        }

        $response = Invoke-RestMethod -Method Post -Uri $url -Body $body

        if ($response.Status -ne 'sent') {
            Write-Warning 'Message not sent'
        }
    }

    end {
    }
}

function New-HipChatRoom {
throw "not implemented yet"
}

function Remove-HipChatRoom {
throw "not implemented yet"
}

function Get-HipChatHistory {
throw "not implemented yet"
}

function Get-HipChatRoomList {
throw "not implemented yet"
}

function Get-HipChatTopic {
throw "not implemented yet"
}

function Get-HipChatRoom {
throw "not implemented yet"
}
#endregion

#region User API
function New-HipChatUser {
throw "not implemented yet"
}

function Remove-HipChatUser {
throw "not implemented yet"
}

function Get-HipChatUserList {
throw "not implemented yet"
}

function Get-HipChatUser {
throw "not implemented yet"
}

function Restore-HipChatUser {
throw "not implemented yet"
}

function Set-HipChatUser {
throw "not implemented yet"
}

#endregion
