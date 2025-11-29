using AiAgentStarterKit.Agents.Base;
using AiAgentStarterKit.Services.OpenAI;

namespace AiAgentStarterKit.Agents.Samples;

public sealed class ResearchAgent : BaseAgent
{
    private readonly OpenAIService _openAi;

    public ResearchAgent(OpenAIService openAi)
        : base("ResearchAgent")
    {
        _openAi = openAi;
    }

    public override async Task<AgentResult> ExecuteAsync(AgentContext context, CancellationToken cancellationToken = default)
    {
        var prompt = $"""
        You are an enterprise research agent.
        Task: {context.TaskDescription}

        Provide a structured JSON response with:
        - summary
        - key_points
        - risks
        - recommended_next_actions
        """;

        var response = await _openAi.GetStructuredResponseAsync(prompt, cancellationToken);

        return AgentResult.Ok(response, "Research completed.");
    }
}
