namespace AiAgentStarterKit.Agents.Base;

public abstract class BaseAgent
{
    public string Name { get; }

    protected BaseAgent(string name)
    {
        Name = name;
    }

    public abstract Task<AgentResult> ExecuteAsync(AgentContext context, CancellationToken cancellationToken = default);
}

public sealed record AgentContext(string TaskDescription, IDictionary<string, object>? Metadata);

public sealed record AgentResult(bool Success, string? Message, object? Payload)
{
    public static AgentResult Ok(object? payload = null, string? message = null)
        => new(true, message, payload);

    public static AgentResult Fail(string message)
        => new(false, message, null);
}
